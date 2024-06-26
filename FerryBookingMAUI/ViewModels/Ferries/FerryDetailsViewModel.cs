using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Ferries;
using System.Collections.ObjectModel;

namespace FerryBookingMAUI.ViewModels.Ferries
{
    [QueryProperty(nameof(FerryId), nameof(FerryId))]
    public class FerryDetailsViewModel : BaseViewModel
    {
        private readonly IFerryService _ferryService;
        public Ferry SelectedFerry { get; private set; }
        public ObservableCollection<Car> Cars { get; private set; } = new ObservableCollection<Car>();
        public ObservableCollection<Guest> Guests { get; private set; } = new ObservableCollection<Guest>();

        public FerryDetailsViewModel() : this(MauiProgram.Services.GetService<IFerryService>()) { }

        public FerryDetailsViewModel(IFerryService ferryService)
        {
            _ferryService = ferryService;
        }

        public string FerryId { set => LoadFerry(value); }

        private async void LoadFerry(string ferryId)
        {
            if (int.TryParse(ferryId, out int id))
            {
                SelectedFerry = await _ferryService.GetFerryByIdAsync(id);
                Cars.Clear();
                Guests.Clear();
                if (SelectedFerry != null)
                {
                    foreach (var car in SelectedFerry.Cars)
                    {
                        Cars.Add(car);
                        foreach (var guest in car.Guests)
                        {
                            Guests.Add(guest);
                        }
                    }
                }
                OnPropertyChanged(nameof(SelectedFerry));
                OnPropertyChanged(nameof(Cars));
                OnPropertyChanged(nameof(Guests));
                OnPropertyChanged(nameof(TotalPrice));
            }
        }

        // Calculated property for TotalPrice
        public double TotalPrice => SelectedFerry?.GetTotalPrice() ?? 0;
    }
}
