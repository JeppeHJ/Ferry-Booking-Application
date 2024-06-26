using System.Collections.ObjectModel;
using System.ComponentModel.DataAnnotations;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Ferries;

namespace FerryBookingMAUI.ViewModels.Ferries
{
    [QueryProperty(nameof(FerryId), nameof(FerryId))]
    public class EditFerryViewModel : BaseViewModel
    {
        private readonly IFerryService _ferryService;
        public Ferry SelectedFerry { get; set; }

        public EditFerryViewModel() : this(MauiProgram.Services.GetService<IFerryService>()) { }

        public EditFerryViewModel(IFerryService ferryService)
        {
            _ferryService = ferryService;
            SaveFerryCommand = new Command(async () => await SaveFerryAsync());
        }

        public string FerryId { set => LoadFerry(value); }
        public ICommand SaveFerryCommand { get; }

        private async void LoadFerry(string ferryId)
        {
            if (int.TryParse(ferryId, out int id))
            {
                SelectedFerry = await _ferryService.GetFerryByIdAsync(id);
                OnPropertyChanged(nameof(SelectedFerry));
            }
        }

        private async Task SaveFerryAsync()
        {
            await _ferryService.UpdateFerryAsync(SelectedFerry);

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
