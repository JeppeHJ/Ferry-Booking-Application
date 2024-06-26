using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Guests;

namespace FerryBookingMAUI.ViewModels.Guests
{
    public class CreateGuestViewModel : BaseViewModel
    {
        private readonly IGuestService _guestService;
        public Guest NewGuest { get; set; }
        public ObservableCollection<string> Genders { get; } = new ObservableCollection<string> { "Male", "Female", "Other" };

        public CreateGuestViewModel() : this(MauiProgram.Services.GetService<IGuestService>()) { }

        public CreateGuestViewModel(IGuestService guestService)
        {
            _guestService = guestService;
            NewGuest = new Guest();
            SaveGuestCommand = new Command(async () => await SaveGuestAsync());
        }

        public ICommand SaveGuestCommand { get; }

        private async Task SaveGuestAsync()
        {
            await _guestService.AddGuestAsync(NewGuest);

            // Reload the guests list in the GuestViewModel
            var guestViewModel = MauiProgram.Services.GetService<GuestViewModel>();
            if (guestViewModel != null)
            {
                await guestViewModel.LoadGuestsAsync();
            }

            await Shell.Current.GoToAsync("..");
        }
    }
}
