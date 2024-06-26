using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FerryBookingModels;

namespace FerryBookingAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FerriesController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public FerriesController(ApplicationDbContext context)
        {
            _context = context;
        }

        // GET: api/Ferries
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Ferry>>> GetFerries()
        {
            return await _context.Ferries.Include(f => f.Cars).Include(f => f.Guests).ToListAsync();
        }

        // GET: api/Ferries/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Ferry>> GetFerry(int id)
        {
            var ferry = await _context.Ferries.Include(f => f.Cars).Include(f => f.Guests).FirstOrDefaultAsync(f => f.Id == id);

            if (ferry == null)
            {
                return NotFound();
            }

            return ferry;
        }

        // PUT: api/Ferries/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutFerry(int id, Ferry ferry)
        {
            if (id != ferry.Id)
            {
                return BadRequest();
            }

            _context.Entry(ferry).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!FerryExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Ferries
        [HttpPost]
        public async Task<ActionResult<Ferry>> PostFerry(Ferry ferry)
        {
            _context.Ferries.Add(ferry);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetFerry), new { id = ferry.Id }, ferry);
        }

        // DELETE: api/Ferries/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteFerry(int id)
        {
            var ferry = await _context.Ferries.FindAsync(id);
            if (ferry == null)
            {
                return NotFound();
            }

            _context.Ferries.Remove(ferry);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool FerryExists(int id)
        {
            return _context.Ferries.Any(e => e.Id == id);
        }
    }
}
