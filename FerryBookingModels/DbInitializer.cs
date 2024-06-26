using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Linq;

namespace FerryBookingModels
{
    public static class DbInitializer
    {
        public static void Initialize(IServiceProvider serviceProvider)
        {
            using (var context = new ApplicationDbContext(
                serviceProvider.GetRequiredService<DbContextOptions<ApplicationDbContext>>()))
            {
                // Ensure the database is created
                context.Database.EnsureCreated();

                // Look for any ferries.
                if (context.Ferries.Any())
                {
                    return;   // DB has been seeded
                }

                var ferries = new Ferry[]
                {
                    new Ferry { Id = 1, MaxGuests = 100, MaxCars = 50, PricePerCar = 197, PricePerGuest = 99 },
                    new Ferry { Id = 2, MaxGuests = 150, MaxCars = 70, PricePerCar = 197, PricePerGuest = 99 }
                };

                foreach (Ferry f in ferries)
                {
                    context.Ferries.Add(f);
                }

                var guests = new Guest[]
                {
                    new Guest { Id = 1, Name = "John Doe", Age = 30, Gender = "Male" },
                    new Guest { Id = 2, Name = "Jane Doe", Age = 28, Gender = "Female" }
                };

                foreach (Guest g in guests)
                {
                    context.Guests.Add(g);
                }

                var cars = new Car[]
                {
                    new Car { Id = 1, RegistrationPlate = "ABC123", Guests = new List<Guest> { guests[0] } },
                    new Car { Id = 2, RegistrationPlate = "XYZ789", Guests = new List<Guest> { guests[1] } }
                };


                foreach (Car c in cars)
                {
                    context.Cars.Add(c);
                }

                context.SaveChanges();
            }
        }
    }
}
