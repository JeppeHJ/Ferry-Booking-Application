using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Cars;
using System.Collections.ObjectModel;

namespace FerryBookingMAUI.ViewModels.Cars
{
    [QueryProperty(nameof(CarId), nameof(CarId))]
    public class CarDetailsViewModel : BaseViewModel
    {
        private readonly ICarService _carService;
        public Car SelectedCar { get; private set; }
        public ObservableCollection<Guest> Guests { get; private set; } = new ObservableCollection<Guest>();

        public CarDetailsViewModel() : this(MauiProgram.Services.GetService<ICarService>()) { }

        public CarDetailsViewModel(ICarService carService)
        {
            _carService = carService;
        }

        public string CarId { set => LoadCar(value); }

        private async void LoadCar(string carId)
        {
            if (int.TryParse(carId, out int id))
            {
                SelectedCar = await _carService.GetCarByIdAsync(id);
                Guests.Clear();
                foreach (var guest in SelectedCar.Guests)
                {
                    Guests.Add(guest);
                }
                OnPropertyChanged(nameof(SelectedCar));
                OnPropertyChanged(nameof(Guests));
            }
        }
    }
}
