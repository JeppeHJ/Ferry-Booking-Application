using FerryBookingMAUI.Services.Cars;
using FerryBookingMAUI.ViewModels.Cars;

namespace FerryBookingMAUI.Views.Car
{
    public partial class CarListView : ContentPage
    {
        public CarListView()
        {
            InitializeComponent();
            BindingContext = new CarViewModel(new CarService(new HttpClient { BaseAddress = new Uri("https://localhost:5001") }));
        }
    }
}
