using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;
using FerryBookingModels;

namespace FerryBookingMAUI.Services.Ferries
{
    public class FerryService : IFerryService
    {
        private readonly HttpClient _httpClient;

        public FerryService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<IEnumerable<Ferry>> GetFerriesAsync()
        {
            return await _httpClient.GetFromJsonAsync<IEnumerable<Ferry>>("https://localhost:7113/api/Ferries");
        }

        public async Task<Ferry> GetFerryByIdAsync(int id)
        {
            return await _httpClient.GetFromJsonAsync<Ferry>($"https://localhost:7113/api/Ferries/{id}");
        }

        public async Task AddFerryAsync(Ferry ferry)
        {
            await _httpClient.PostAsJsonAsync("https://localhost:7113/api/Ferries", ferry);
        }

        public async Task UpdateFerryAsync(Ferry ferry)
        {
            await _httpClient.PutAsJsonAsync($"https://localhost:7113/api/Ferries/{ferry.Id}", ferry);
        }

        public async Task DeleteFerryAsync(int id)
        {
            await _httpClient.DeleteAsync($"https://localhost:7113/api/Ferries/{id}");
        }
    }
}
