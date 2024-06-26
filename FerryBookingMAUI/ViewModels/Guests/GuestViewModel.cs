using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Guests;

namespace FerryBookingMAUI.ViewModels.Guests
{
    public class GuestViewModel : BaseViewModel
    {
        private readonly IGuestService _guestService;
        public ObservableCollection<Guest> Guests { get; }

        // Parameterless constructor for XAML instantiation
        public GuestViewModel() : this(MauiProgram.Services.GetService<IGuestService>()) { }

        public GuestViewModel(IGuestService guestService)
        {
            _guestService = guestService;
            Guests = new ObservableCollection<Guest>();
            LoadGuestsCommand = new Command(async () => await LoadGuestsAsync());
            CreateNewGuestCommand = new Command(async () => await Shell.Current.GoToAsync("///CreateGuestPage"));
            EditGuestCommand = new Command<Guest>(async (guest) => await Shell.Current.GoToAsync($"///EditGuestPage?GuestId={guest.Id}"));
            ViewGuestDetailsCommand = new Command<Guest>(async (guest) => await Shell.Current.GoToAsync($"///GuestDetailsPage?GuestId={guest.Id}"));
            DeleteGuestCommand = new Command<Guest>(async (guest) => await DeleteGuestAsync(guest.Id));

            LoadGuestsCommand.Execute(null);
        }

        public ICommand LoadGuestsCommand { get; }
        public ICommand CreateNewGuestCommand { get; }
        public ICommand EditGuestCommand { get; }
        public ICommand ViewGuestDetailsCommand { get; }
        public ICommand DeleteGuestCommand { get; }

        public async Task LoadGuestsAsync()
        {
            if (IsBusy) return;

            IsBusy = true;

            try
            {
                Guests.Clear();
                var guests = await _guestService.GetGuestsAsync();
                foreach (var guest in guests)
                {
                    Guests.Add(guest);
                }
            }
            finally
            {
                IsBusy = false;
            }
        }

        private async Task DeleteGuestAsync(int id)
        {
            await _guestService.DeleteGuestAsync(id);
            await LoadGuestsAsync();
        }
    }
}
