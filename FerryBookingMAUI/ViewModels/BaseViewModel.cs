using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace FerryBookingMAUI.ViewModels
{
    public abstract class BaseViewModel : INotifyPropertyChanged
    {
        private bool isBusy = false;

        public bool IsBusy
        {
            get => isBusy;
            set
            {
                if (isBusy != value)
                {
                    isBusy = value;
                    OnPropertyChanged();
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
