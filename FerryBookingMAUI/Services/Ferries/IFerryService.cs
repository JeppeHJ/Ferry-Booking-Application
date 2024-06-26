using System.Collections.Generic;
using System.Threading.Tasks;
using FerryBookingModels;

namespace FerryBookingMAUI.Services.Ferries
{
    public interface IFerryService
    {
        Task<IEnumerable<Ferry>> GetFerriesAsync();
        Task<Ferry> GetFerryByIdAsync(int id);
        Task AddFerryAsync(Ferry ferry);
        Task UpdateFerryAsync(Ferry ferry);
        Task DeleteFerryAsync(int id);
    }
}
