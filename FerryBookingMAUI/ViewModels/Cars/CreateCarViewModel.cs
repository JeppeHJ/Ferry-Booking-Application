using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Cars;

namespace FerryBookingMAUI.ViewModels.Cars
{
    public class CreateCarViewModel : BaseViewModel, INotifyPropertyChanged
    {
        private readonly ICarService _carService;
        public Car NewCar { get; }

        private ObservableCollection<Guest> _guests;
        public ObservableCollection<Guest> Guests
        {
            get => _guests;
            set
            {
                _guests = value;
                OnPropertyChanged();
            }
        }

        private int _numberOfGuests;
        public int NumberOfGuests
        {
            get => _numberOfGuests;
            set
            {
                if (_numberOfGuests != value)
                {
                    _numberOfGuests = value;
                    UpdateGuests();
                    OnPropertyChanged();
                }
            }
        }

        public ObservableCollection<int> GuestNumbers { get; } = new ObservableCollection<int> { 1, 2, 3, 4, 5 };

        public CreateCarViewModel()
        {
            _carService = MauiProgram.Services.GetService<ICarService>();
            NewCar = new Car();
            Guests = new ObservableCollection<Guest>();
            SaveCarCommand = new Command(async () => await SaveCarAsync());
        }

        public ICommand SaveCarCommand { get; }

        private void UpdateGuests()
        {
            while (Guests.Count < NumberOfGuests)
            {
                Guests.Add(new Guest());
            }

            while (Guests.Count > NumberOfGuests)
            {
                Guests.RemoveAt(Guests.Count - 1);
            }

            NewCar.Guests = Guests.ToList();
        }

        private async Task SaveCarAsync()
        {
            NewCar.NumberOfGuests = NumberOfGuests;
            await _carService.AddCarAsync(NewCar);

            // Reload the cars list in the CarViewModel
            var carViewModel = MauiProgram.Services.GetService<CarViewModel>();
            if (carViewModel != null)
            {
                await carViewModel.LoadCarsAsync();
            }

            await Shell.Current.GoToAsync("..");
        }
    }
}
