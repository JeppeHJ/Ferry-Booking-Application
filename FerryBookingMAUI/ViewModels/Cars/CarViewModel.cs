using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Cars;

namespace FerryBookingMAUI.ViewModels.Cars
{
    public class CarViewModel : BaseViewModel
    {
        private readonly ICarService _carService;
        public ObservableCollection<Car> Cars { get; }

        // Default constructor for XAML instantiation
        public CarViewModel() : this(MauiProgram.Services.GetService<ICarService>()) { }

        public CarViewModel(ICarService carService)
        {
            _carService = carService;
            Cars = new ObservableCollection<Car>();
            LoadCarsCommand = new Command(async () => await LoadCarsAsync());
            CreateNewCarCommand = new Command(async () => await Shell.Current.GoToAsync("///CreateCarPage"));
            EditCarCommand = new Command<Car>(async (car) => await Shell.Current.GoToAsync($"///EditCarPage?CarId={car.Id}"));
            ViewCarDetailsCommand = new Command<Car>(async (car) => await Shell.Current.GoToAsync($"///CarDetailsPage?CarId={car.Id}"));
            DeleteCarCommand = new Command<Car>(async (car) => await DeleteCarAsync(car.Id));

            // Load cars when the ViewModel is created
            LoadCarsCommand.Execute(null);
        }

        public ICommand LoadCarsCommand { get; }
        public ICommand CreateNewCarCommand { get; }
        public ICommand EditCarCommand { get; }
        public ICommand ViewCarDetailsCommand { get; }
        public ICommand DeleteCarCommand { get; }

        public async Task LoadCarsAsync()
        {
            if (IsBusy) return;

            IsBusy = true;

            try
            {
                Cars.Clear();
                var cars = await _carService.GetCarsAsync();
                foreach (var car in cars)
                {
                    Debug.WriteLine($"Car ID: {car.Id}, RegistrationPlate: {car.RegistrationPlate}, Guests Count: {car.Guests?.Count ?? 0}");
                    if (car.Guests == null || car.Guests.Count == 0)
                    {
                        Debug.WriteLine($"Car ID: {car.Id} has no guests.");
                    }
                    else
                    {
                        foreach (var guest in car.Guests)
                        {
                            Debug.WriteLine($"Guest ID: {guest.Id}, Name: {guest.Name}, Age: {guest.Age}, Gender: {guest.Gender}");
                        }
                    }
                    Cars.Add(car);
                }
            }
            finally
            {
                IsBusy = false;
            }
        }

        private async Task DeleteCarAsync(int id)
        {
            await _carService.DeleteCarAsync(id);
            await LoadCarsAsync();
        }
    }
}
