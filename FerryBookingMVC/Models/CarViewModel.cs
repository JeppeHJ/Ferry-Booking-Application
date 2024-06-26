using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace FerryBookingMVC.Models
{
    public class CarViewModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Registration Plate is required")]
        [RegularExpression("^[a-zA-Z0-9-]*$", ErrorMessage = "Invalid input: Only letters, numbers, and hyphens are allowed")]
        public string RegistrationPlate { get; set; }

        [Range(1, 5, ErrorMessage = "Number of guests must be between 1 and 5")]
        public int NumberOfGuests { get; set; }

        public List<GuestViewModel> Guests { get; set; } = new List<GuestViewModel>();

        public class GuestViewModel
        {
            [Required(ErrorMessage = "Name is required")]
            [RegularExpression("^[a-zA-Z]+$", ErrorMessage = "Name can only contain letters")]
            public string Name { get; set; }

            [Required(ErrorMessage = "Age is required")]
            [Range(0, 120, ErrorMessage = "Please enter a valid age between 0 and 120")]
            public int Age { get; set; }

            [Required(ErrorMessage = "Gender is required")]
            public string Gender { get; set; }
        }
    }
}
