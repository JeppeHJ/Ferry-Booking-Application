﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;

namespace FerryBookingModels
{
    public class ApplicationDbContextFactory : IDesignTimeDbContextFactory<ApplicationDbContext>
    {
        public ApplicationDbContext CreateDbContext(string[] args)
        {
            var optionsBuilder = new DbContextOptionsBuilder<ApplicationDbContext>();
            optionsBuilder.UseSqlServer("Server=(localdb)\\mssqllocaldb;Database=FerryBookingDB;Trusted_Connection=True;MultipleActiveResultSets=true",
                b => b.MigrationsAssembly("FerryBookingModels"));

            return new ApplicationDbContext(optionsBuilder.Options);
        }
    }
}
