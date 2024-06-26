using System.Net.Http.Json;
using FerryBookingModels;
using System.Diagnostics;

namespace FerryBookingMAUI.Services.Cars
{
    public class CarService : ICarService
    {
        private readonly HttpClient _httpClient;

        public CarService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<IEnumerable<Car>> GetCarsAsync()
        {
            var cars = await _httpClient.GetFromJsonAsync<IEnumerable<Car>>("https://localhost:7113/api/CarsAPI");
            return cars ?? new List<Car>();
        }

        public async Task<Car> GetCarByIdAsync(int id)
        {
            return await _httpClient.GetFromJsonAsync<Car>($"https://localhost:7113/api/CarsAPI/{id}");
        }

        public async Task AddCarAsync(Car car)
        {
            await _httpClient.PostAsJsonAsync("https://localhost:7113/api/CarsAPI", car);
        }

        public async Task UpdateCarAsync(Car car)
        {
            var response = await _httpClient.PutAsJsonAsync($"https://localhost:7113/api/CarsAPI/{car.Id}", car);
            if (!response.IsSuccessStatusCode)
            {
                var content = await response.Content.ReadAsStringAsync();
                Debug.WriteLine($"Error: {response.StatusCode}, Content: {content}");
                response.EnsureSuccessStatusCode(); 
            }
        }

        public async Task DeleteCarAsync(int id)
        {
            await _httpClient.DeleteAsync($"https://localhost:7113/api/CarsAPI/{id}");
        }
    }
}
