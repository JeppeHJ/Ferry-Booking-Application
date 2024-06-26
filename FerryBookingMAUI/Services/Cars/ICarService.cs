using FerryBookingModels;

namespace FerryBookingMAUI.Services.Cars
{
    public interface ICarService
    {
        Task<IEnumerable<Car>> GetCarsAsync();
        Task<Car> GetCarByIdAsync(int id);
        Task AddCarAsync(Car car);
        Task UpdateCarAsync(Car car);
        Task DeleteCarAsync(int id);
    }
}
