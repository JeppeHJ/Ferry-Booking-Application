using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using FerryBookingModels;

namespace FerryBookingMAUI.Services.Guests
{
    public class GuestService : IGuestService
    {
        private readonly HttpClient _httpClient;

        public GuestService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<IEnumerable<Guest>> GetGuestsAsync()
        {
            return await _httpClient.GetFromJsonAsync<IEnumerable<Guest>>("https://localhost:7113/api/GuestsAPI");
        }

        public async Task<Guest> GetGuestByIdAsync(int id)
        {
            return await _httpClient.GetFromJsonAsync<Guest>($"https://localhost:7113/api/GuestsAPI/{id}");
        }

        public async Task AddGuestAsync(Guest guest)
        {
            await _httpClient.PostAsJsonAsync("https://localhost:7113/api/GuestsAPI", guest);
        }

        public async Task UpdateGuestAsync(Guest guest)
        {
            await _httpClient.PutAsJsonAsync($"https://localhost:7113/api/GuestsAPI/{guest.Id}", guest);
        }

        public async Task DeleteGuestAsync(int id)
        {
            await _httpClient.DeleteAsync($"https://localhost:7113/api/GuestsAPI/{id}");
        }
    }
}
