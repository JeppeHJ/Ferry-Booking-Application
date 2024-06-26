using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Guests;

namespace FerryBookingMAUI.ViewModels.Guests
{
    [QueryProperty(nameof(GuestId), nameof(GuestId))]
    public class EditGuestViewModel : BaseViewModel
    {
        private readonly IGuestService _guestService;
        private Guest _selectedGuest;
        public ObservableCollection<string> Genders { get; } = new ObservableCollection<string> { "Male", "Female", "Other" };

        public EditGuestViewModel() : this(MauiProgram.Services.GetService<IGuestService>()) { }

        public EditGuestViewModel(IGuestService guestService)
        {
            _guestService = guestService;
            SaveGuestCommand = new Command(async () => await SaveGuestAsync(), ValidateSave);
            this.PropertyChanged += (_, __) => ((Command)SaveGuestCommand).ChangeCanExecute();
        }

        public string GuestId { set => LoadGuest(value); }
        public ICommand SaveGuestCommand { get; }

        public Guest SelectedGuest
        {
            get => _selectedGuest;
            set
            {
                _selectedGuest = value;
                OnPropertyChanged();
                if (_selectedGuest != null)
                {
                    _selectedGuest.PropertyChanged += OnGuestPropertyChanged;
                }
                ((Command)SaveGuestCommand).ChangeCanExecute();
            }
        }

        private async void LoadGuest(string guestId)
        {
            int id = int.Parse(guestId);
            SelectedGuest = await _guestService.GetGuestByIdAsync(id);
            OnPropertyChanged(nameof(SelectedGuest));
            ((Command)SaveGuestCommand).ChangeCanExecute();
        }

        private async Task SaveGuestAsync()
        {
            await _guestService.UpdateGuestAsync(SelectedGuest);

            // Reload the guests list in the GuestViewModel
            var guestViewModel = MauiProgram.Services.GetService<GuestViewModel>();
            if (guestViewModel != null)
            {
                await guestViewModel.LoadGuestsAsync();
            }

            await Shell.Current.GoToAsync("..");
        }

        private bool ValidateSave()
        {
            if (SelectedGuest == null) return false;

            var context = new ValidationContext(SelectedGuest);
            var results = new List<ValidationResult>();
            return Validator.TryValidateObject(SelectedGuest, context, results, true);
        }

        private void OnGuestPropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            ((Command)SaveGuestCommand).ChangeCanExecute();
        }
    }
}
