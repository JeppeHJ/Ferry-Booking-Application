using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Windows.Input;
using FerryBookingModels;
using Microsoft.Maui.Controls;
using FerryBookingMAUI.Services.Ferries;

namespace FerryBookingMAUI.ViewModels.Ferries
{
    public class FerryViewModel : BaseViewModel
    {
        private readonly IFerryService _ferryService;
        public ObservableCollection<Ferry> Ferries { get; }

        public FerryViewModel() : this(MauiProgram.Services.GetService<IFerryService>()) { }

        public FerryViewModel(IFerryService ferryService)
        {
            _ferryService = ferryService;
            Ferries = new ObservableCollection<Ferry>();
            LoadFerriesCommand = new Command(async () => await LoadFerriesAsync());
            CreateNewFerryCommand = new Command(async () => await Shell.Current.GoToAsync("///CreateFerryPage"));
            EditFerryCommand = new Command<Ferry>(async (ferry) => await Shell.Current.GoToAsync($"///EditFerryPage?FerryId={ferry.Id}"));
            ViewFerryDetailsCommand = new Command<Ferry>(async (ferry) => await Shell.Current.GoToAsync($"///FerryDetailsPage?FerryId={ferry.Id}"));
            DeleteFerryCommand = new Command<Ferry>(async (ferry) => await DeleteFerryAsync(ferry.Id));

            LoadFerriesCommand.Execute(null);
        }

        public ICommand LoadFerriesCommand { get; }
        public ICommand CreateNewFerryCommand { get; }
        public ICommand EditFerryCommand { get; }
        public ICommand ViewFerryDetailsCommand { get; }
        public ICommand DeleteFerryCommand { get; }

        public async Task LoadFerriesAsync()
        {
            if (IsBusy) return;

            IsBusy = true;

            try
            {
                Ferries.Clear();
                var ferries = await _ferryService.GetFerriesAsync();
                foreach (var ferry in ferries)
                {
                    Ferries.Add(ferry);
                }
            }
            finally
            {
                IsBusy = false;
            }
        }


        private async Task DeleteFerryAsync(int id)
        {
            await _ferryService.DeleteFerryAsync(id);
            await LoadFerriesAsync();
        }
    }
}
