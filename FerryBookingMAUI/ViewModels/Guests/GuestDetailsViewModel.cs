using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Guests;

namespace FerryBookingMAUI.ViewModels.Guests
{
    [QueryProperty(nameof(GuestId), nameof(GuestId))]
    public class GuestDetailsViewModel : BaseViewModel
    {
        private readonly IGuestService _guestService;
        public Guest SelectedGuest { get; private set; }

        public GuestDetailsViewModel() : this(MauiProgram.Services.GetService<IGuestService>()) { }

        public GuestDetailsViewModel(IGuestService guestService)
        {
            _guestService = guestService;
        }

        public string GuestId { set => LoadGuest(value); }

        private async void LoadGuest(string guestId)
        {
            if (int.TryParse(guestId, out int id))
            {
                SelectedGuest = await _guestService.GetGuestByIdAsync(id);
                OnPropertyChanged(nameof(SelectedGuest));
            }
        }
    }
}
