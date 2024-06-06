using EstayBackend.Models;
using Microsoft.EntityFrameworkCore;

namespace EstayBackend.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Users> Users { get; set; }
        public DbSet<PaymentMethod>PaymentMethod { get; set; }
        public DbSet<Transactions> Transactions { get; set; }
        public DbSet<Hotels> Hotels { get; set; }
        public DbSet<Room> Room { get; set; }
        public DbSet<HotelLocation> HotelLocation { get; set; }
        public DbSet<City> City { get; set; }
    }
}
