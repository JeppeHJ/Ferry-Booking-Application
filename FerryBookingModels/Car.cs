using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FerryBookingModels
{
    public class Car
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Registration Plate is required")]
        [RegularExpression(@"^[a-zA-Z0-9]+$", ErrorMessage = "Registration Plate must contain only letters and numbers")]
        public string RegistrationPlate { get; set; } = string.Empty;

        [Required(ErrorMessage = "Number of Guests is required")]
        [Range(1, 5, ErrorMessage = "Number of Guests must be between 1 and 5")]
        public int NumberOfGuests { get; set; }

        public List<Guest> Guests { get; set; } = new List<Guest>();

        public Car(int id, string registrationPlate, int numberOfGuests)
        {
            Id = id;
            RegistrationPlate = registrationPlate;
            NumberOfGuests = numberOfGuests;
        }

        public Car() { }
    }
}
