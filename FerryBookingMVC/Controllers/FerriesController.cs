using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FerryBookingModels;

namespace FerryBookingMVC.Controllers
{
    public class FerriesController : Controller
    {
        private readonly ApplicationDbContext _context;

        public FerriesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: Ferries
        public async Task<IActionResult> Index()
        {
            return View(await _context.Ferries.Include(f => f.Cars).Include(f => f.Guests).ToListAsync());
        }

        // GET: Ferries/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ferry = await _context.Ferries
                .Include(f => f.Cars)
                .Include(f => f.Guests)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (ferry == null)
            {
                return NotFound();
            }

            ViewBag.TotalPrice = ferry.GetTotalPrice();
            ViewBag.TotalGuests = ferry.GetTotalGuests();
            ViewBag.TotalCars = ferry.GetTotalCars();

            return View(ferry);
        }

        // GET: Ferries/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Ferries/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,MaxGuests,MaxCars,PricePerCar,PricePerGuest")] Ferry ferry)
        {
            if (ModelState.IsValid)
            {
                _context.Add(ferry);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(ferry);
        }

        // GET: Ferries/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ferry = await _context.Ferries.FindAsync(id);
            if (ferry == null)
            {
                return NotFound();
            }
            return View(ferry);
        }

        // POST: Ferries/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,MaxGuests,MaxCars,PricePerCar,PricePerGuest")] Ferry ferry)
        {
            if (id != ferry.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(ferry);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!FerryExists(ferry.Id))
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
            return View(ferry);
        }

        // GET: Ferries/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var ferry = await _context.Ferries
                .FirstOrDefaultAsync(m => m.Id == id);
            if (ferry == null)
            {
                return NotFound();
            }

            return View(ferry);
        }

        // POST: Ferries/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var ferry = await _context.Ferries.FindAsync(id);
            if (ferry != null)
            {
                _context.Ferries.Remove(ferry);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool FerryExists(int id)
        {
            return _context.Ferries.Any(e => e.Id == id);
        }
    }
}