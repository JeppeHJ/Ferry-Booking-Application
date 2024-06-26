using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FerryBookingModels
{
    public class Ferry
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Max Guests is required")]
        [Range(1, 1000, ErrorMessage = "Max Guests must be between 1 and 1000")]
        public int MaxGuests { get; set; }

        [Required(ErrorMessage = "Max Cars is required")]
        [Range(1, 100, ErrorMessage = "Max Cars must be between 1 and 100")]
        public int MaxCars { get; set; }

        public List<Guest> Guests { get; set; } = new List<Guest>();
        public List<Car> Cars { get; set; } = new List<Car>();

        [Required(ErrorMessage = "Price Per Car is required")]
        [Range(0.0, double.MaxValue, ErrorMessage = "Price Per Car must be a positive value")]
        public double PricePerCar { get; set; } = 197;

        [Required(ErrorMessage = "Price Per Guest is required")]
        [Range(0.0, double.MaxValue, ErrorMessage = "Price Per Guest must be a positive value")]
        public double PricePerGuest { get; set; } = 99;

        public Ferry(int id, int maxGuests, int maxCars, double pricePerCar, double pricePerGuest)
        {
            Id = id;
            MaxGuests = maxGuests;
            MaxCars = maxCars;
            PricePerCar = pricePerCar;
            PricePerGuest = pricePerGuest;
        }

        public Ferry() { }

        public bool AddGuest(Guest guest)
        {
            if (Guests.Count < MaxGuests)
            {
                Guests.Add(guest);
                return true;
            }
            return false;
        }

        public bool AddCar(Car car)
        {
            int totalGuestsInCar = car.Guests.Count + 1; // Including driver

            if (Cars.Count < MaxCars && (Guests.Count + totalGuestsInCar) <= MaxGuests)
            {
                Cars.Add(car);
                Guests.AddRange(car.Guests);
                return true;
            }
            return false;
        }

        public void RemoveGuest(Guest guest)
        {
            if (Guests.Contains(guest))
            {
                Guests.Remove(guest);
            }
        }

        public void RemoveCar(Car car)
        {
            if (Cars.Contains(car))
            {
                Cars.Remove(car);
                Guests.RemoveAll(g => car.Guests.Contains(g));
            }
        }

        public double GetTotalPrice()
        {
            double totalCarPrice = Cars.Count * PricePerCar;
            double totalGuestPrice = Guests.Count * PricePerGuest;
            return totalCarPrice + totalGuestPrice;
        }

        public int GetTotalGuests()
        {
            return Guests.Count;
        }

        public int GetTotalCars()
        {
            return Cars.Count;
        }

        public void UpdateMaxGuests(int newMaxGuests)
        {
            MaxGuests = newMaxGuests;
        }

        public void UpdateMaxCars(int newMaxCars)
        {
            MaxCars = newMaxCars;
        }

        public void UpdatePrices(double newPricePerCar, double newPricePerGuest)
        {
            PricePerCar = newPricePerCar;
            PricePerGuest = newPricePerGuest;
        }
    }
}
