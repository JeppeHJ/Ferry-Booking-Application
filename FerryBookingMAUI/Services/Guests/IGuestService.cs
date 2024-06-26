using System.Collections.Generic;
using System.Threading.Tasks;
using FerryBookingModels;

namespace FerryBookingMAUI.Services.Guests
{
    public interface IGuestService
    {
        Task<IEnumerable<Guest>> GetGuestsAsync();
        Task<Guest> GetGuestByIdAsync(int id);
        Task AddGuestAsync(Guest guest);
        Task UpdateGuestAsync(Guest guest);
        Task DeleteGuestAsync(int id);
    }
}
