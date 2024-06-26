using FerryBookingMAUI.ViewModels.Ferries;
using Microsoft.Maui.Controls;

namespace FerryBookingMAUI.Views.Ferry
{
    public partial class FerryPage : ContentPage
    {
        public FerryPage(FerryViewModel viewModel)
        {
            InitializeComponent();
            BindingContext = viewModel;
        }
    }
}
