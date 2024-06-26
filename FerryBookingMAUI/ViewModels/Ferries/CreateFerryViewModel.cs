using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Ferries;

namespace FerryBookingMAUI.ViewModels.Ferries
{
    public class CreateFerryViewModel : BaseViewModel
    {
        private readonly IFerryService _ferryService;
        public Ferry NewFerry { get; set; } = new Ferry();

        public CreateFerryViewModel() : this(MauiProgram.Services.GetService<IFerryService>()) { }

        public CreateFerryViewModel(IFerryService ferryService)
        {
            _ferryService = ferryService;
            SaveFerryCommand = new Command(async () => await SaveFerryAsync());
        }

        public ICommand SaveFerryCommand { get; }

        private async Task SaveFerryAsync()
        {
            await _ferryService.AddFerryAsync(NewFerry);

            // Reload the ferries list in the FerryViewModel
            var ferryViewModel = MauiProgram.Services.GetService<FerryViewModel>();
            if (ferryViewModel != null)
            {
                await ferryViewModel.LoadFerriesAsync();
            }

            await Shell.Current.GoToAsync("..");
        }
    }
}
