using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FerryBookingModels.Migrations
{
    /// <inheritdoc />
    public partial class AddNumberOfGuestsToCar : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "NumberOfGuests",
                table: "Cars",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NumberOfGuests",
                table: "Cars");
        }
    }
}
