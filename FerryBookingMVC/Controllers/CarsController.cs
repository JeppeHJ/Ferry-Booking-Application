using FerryBookingModels;
using FerryBookingMVC.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace FerryBookingMVC.Controllers
{
    public class CarsController : Controller
    {
        private readonly ApplicationDbContext _context;

        public CarsController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Cars
        public async Task<IActionResult> Index()
        {
            var cars = await _context.Cars.Include(c => c.Guests).ToListAsync();
            return View(cars);
        }

        // GET: Cars/Create
        public IActionResult Create()
        {
            return View(new CarViewModel());
        }

        // POST: Cars/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(CarViewModel carViewModel)
        {
            if (ModelState.IsValid)
            {
                if (carViewModel.Guests.Count < 1 || carViewModel.Guests.Count > 5)
                {
                    ModelState.AddModelError(string.Empty, "A car must have between 1 and 5 guests.");
                    return View(carViewModel);
                }

                var car = new Car
                {
                    RegistrationPlate = carViewModel.RegistrationPlate,
                    NumberOfGuests = carViewModel.NumberOfGuests,
                    Guests = carViewModel.Guests.Select(g => new Guest
                    {
                        Name = g.Name,
                        Age = g.Age,
                        Gender = g.Gender
                    }).ToList()
                };

                var ferry = await _context.Ferries.Include(f => f.Guests).Include(f => f.Cars).FirstOrDefaultAsync();
                if (ferry == null || (ferry.Guests.Count + car.Guests.Count + 1) > ferry.MaxGuests || ferry.Cars.Count >= ferry.MaxCars)
                {
                    ModelState.AddModelError(string.Empty, "Cannot add this car to the ferry due to capacity constraints.");
                    return View(carViewModel);
                }

                _context.Add(car);
                ferry.Cars.Add(car);
                ferry.Guests.AddRange(car.Guests);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }

            return View(carViewModel);
        }

        // GET: Cars/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var car = await _context.Cars
                .Include(c => c.Guests)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (car == null)
            {
                return NotFound();
            }

            return View(car);
        }

        // GET: Cars/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var car = await _context.Cars.Include(c => c.Guests).FirstOrDefaultAsync(c => c.Id == id);
            if (car == null)
            {
                return NotFound();
            }

            var carViewModel = new CarViewModel
            {
                Id = car.Id,
                RegistrationPlate = car.RegistrationPlate,
                NumberOfGuests = car.NumberOfGuests,
                Guests = car.Guests.Select(g => new CarViewModel.GuestViewModel
                {
                    Name = g.Name,
                    Age = g.Age,
                    Gender = g.Gender
                }).ToList()
            };

            return View(carViewModel);
        }

        // POST: Cars/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, CarViewModel carViewModel)
        {
            if (id != carViewModel.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    var car = await _context.Cars.Include(c => c.Guests).FirstOrDefaultAsync(c => c.Id == id);
                    if (car == null)
                    {
                        return NotFound();
                    }

                    car.RegistrationPlate = carViewModel.RegistrationPlate;
                    car.NumberOfGuests = carViewModel.NumberOfGuests;
                    car.Guests = carViewModel.Guests.Select(g => new Guest
                    {
                        Name = g.Name,
                        Age = g.Age,
                        Gender = g.Gender
                    }).ToList();

                    _context.Update(car);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CarExists(carViewModel.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(carViewModel);
        }

        // GET: Cars/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var car = await _context.Cars
                .FirstOrDefaultAsync(m => m.Id == id);
            if (car == null)
            {
                return NotFound();
            }

            return View(car);
        }

        // POST: Cars/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var car = await _context.Cars.FindAsync(id);
            if (car != null)
            {
                var ferry = await _context.Ferries.Include(f => f.Cars).Include(f => f.Guests).FirstOrDefaultAsync();
                if (ferry != null)
                {
                    ferry.Cars.Remove(car);
                    ferry.Guests.RemoveAll(g => car.Guests.Contains(g));
                }
                _context.Cars.Remove(car);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction(nameof(Index));
        }

        private bool CarExists(int id)
        {
            return _context.Cars.Any(e => e.Id == id);
        }
    }
}
