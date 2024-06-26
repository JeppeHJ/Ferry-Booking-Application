using FerryBookingMAUI.Services.Cars;
using FerryBookingMAUI.Services.Ferries;
using FerryBookingMAUI.Services.Guests;
using FerryBookingMAUI.ViewModels;
using FerryBookingMAUI.ViewModels.Ferries;
using FerryBookingMAUI.ViewModels.Cars;
using FerryBookingMAUI.ViewModels.Guests;
using FerryBookingMAUI.Views;
using FerryBookingMAUI.Views.Ferry;
using FerryBookingMAUI.Views.Car;
using FerryBookingMAUI.Views.Guest;

namespace FerryBookingMAUI
{
    public static class MauiProgram
    {
        public static IServiceProvider Services { get; private set; }

        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                });

            // Register services and view models
            builder.Services.AddSingleton<ICarService, CarService>();
            builder.Services.AddSingleton<IFerryService, FerryService>();
            builder.Services.AddSingleton<IGuestService, GuestService>();
            builder.Services.AddHttpClient<ICarService, CarService>(client =>
            {
                client.BaseAddress = new Uri("https://localhost:7113");
            });
            builder.Services.AddHttpClient<IFerryService, FerryService>(client =>
            {
                client.BaseAddress = new Uri("https://localhost:7113");
            });
            builder.Services.AddHttpClient<IGuestService, GuestService>(client =>
            {
                client.BaseAddress = new Uri("https://localhost:7113");
            });

            builder.Services.AddSingleton<MainViewModel>();
            builder.Services.AddSingleton<MainPage>();
            builder.Services.AddTransient<CarViewModel>();
            builder.Services.AddTransient<CarListView>();
            builder.Services.AddTransient<CreateCarPage>();
            builder.Services.AddTransient<EditCarPage>();
            builder.Services.AddTransient<CarDetailsPage>();
            builder.Services.AddTransient<FerryViewModel>();
            builder.Services.AddTransient<FerryPage>();
            builder.Services.AddTransient<GuestViewModel>();
            builder.Services.AddTransient<GuestPage>();
            builder.Services.AddTransient<CreateGuestPage>();
            builder.Services.AddTransient<EditGuestPage>();
            builder.Services.AddTransient<GuestDetailsPage>();

            var app = builder.Build();
            Services = app.Services;

            return app;
        }
    }
}
