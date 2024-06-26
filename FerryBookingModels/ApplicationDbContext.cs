using Microsoft.EntityFrameworkCore;

namespace FerryBookingModels
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
        }

        public DbSet<Ferry> Ferries { get; set; }
        public DbSet<Car> Cars { get; set; }
        public DbSet<Guest> Guests { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=FerryBookingDB;Trusted_Connection=True;MultipleActiveResultSets=true",
                    b => b.MigrationsAssembly("FerryBookingModels"));
            }
        }
    }
}
