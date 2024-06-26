using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Cars;
using FerryBookingMAUI.Services.Ferries;
using FerryBookingMAUI.Services.Guests;

namespace FerryBookingMAUI.ViewModels
{
    public class MainViewModel : BaseViewModel
    {
        private readonly ICarService _carService;
        private readonly IFerryService _ferryService;
        private readonly IGuestService _guestService;

        public ObservableCollection<Car> Cars { get; }
        public ObservableCollection<Ferry> Ferries { get; }
        public ObservableCollection<Guest> Guests { get; }

        // Default constructor for XAML instantiation
        public MainViewModel() : this(MauiProgram.Services.GetService<ICarService>(),
                                       MauiProgram.Services.GetService<IFerryService>(),
                                       MauiProgram.Services.GetService<IGuestService>())
        {
        }

        public MainViewModel(ICarService carService, IFerryService ferryService, IGuestService guestService)
        {
            _carService = carService;
            _ferryService = ferryService;
            _guestService = guestService;
            Cars = new ObservableCollection<Car>();
            Ferries = new ObservableCollection<Ferry>();
            Guests = new ObservableCollection<Guest>();

            // Initialize commands
            NavigateToFerryManagementCommand = new Command(async () => await Shell.Current.GoToAsync("///FerryPage"));
            NavigateToCarManagementCommand = new Command(async () => await Shell.Current.GoToAsync("///CarListView"));
            NavigateToGuestManagementCommand = new Command(async () => await Shell.Current.GoToAsync("///GuestPage"));
        }

        public ICommand NavigateToFerryManagementCommand { get; }
        public ICommand NavigateToCarManagementCommand { get; }
        public ICommand NavigateToGuestManagementCommand { get; }

        public async Task LoadAllDataAsync()
        {
            if (IsBusy) return;

            IsBusy = true;

            try
            {
                var cars = await _carService.GetCarsAsync();
                var ferries = await _ferryService.GetFerriesAsync();
                var guests = await _guestService.GetGuestsAsync();

                Cars.Clear();
                foreach (var car in cars)
                {
                    Cars.Add(car);
                }

                Ferries.Clear();
                foreach (var ferry in ferries)
                {
                    Ferries.Add(ferry);
                }

                Guests.Clear();
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
    }
}
