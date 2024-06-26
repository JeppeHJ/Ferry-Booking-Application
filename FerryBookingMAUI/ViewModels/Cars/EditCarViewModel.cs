using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Cars;

namespace FerryBookingMAUI.ViewModels.Cars
{
    [QueryProperty(nameof(CarId), nameof(CarId))]
    public class EditCarViewModel : BaseViewModel
    {
        private readonly ICarService _carService;
        public Car SelectedCar { get; private set; }

        public EditCarViewModel()
        {
            _carService = MauiProgram.Services.GetService<ICarService>();
            SaveCarCommand = new Command(async () => await SaveCarAsync());
        }

        public string CarId { set => LoadCar(value); }
        public ICommand SaveCarCommand { get; }

        private async void LoadCar(string carId)
        {
            int id = int.Parse(carId);
            SelectedCar = await _carService.GetCarByIdAsync(id);
            if (SelectedCar != null)
            {
                SelectedCar.NumberOfGuests = SelectedCar.Guests?.Count ?? 0;
                OnPropertyChanged(nameof(SelectedCar));
            }
        }

        private async Task SaveCarAsync()
        {
            if (SelectedCar == null || string.IsNullOrWhiteSpace(SelectedCar.RegistrationPlate))
            {
                await Shell.Current.DisplayAlert("Validation Error", "Registration Plate is required.", "OK");
                return;
            }

            if (SelectedCar.NumberOfGuests < 1 || SelectedCar.NumberOfGuests > 5)
            {
                await Shell.Current.DisplayAlert("Validation Error", "Number of Guests must be between 1 and 5.", "OK");
                return;
            }

            try
            {
                await _carService.UpdateCarAsync(SelectedCar);
                await Shell.Current.GoToAsync("..");
            }
            catch (Exception ex)
            {
                await Shell.Current.DisplayAlert("Update Error", $"Failed to update the car: {ex.Message}", "OK");
            }
        }
    }
}
