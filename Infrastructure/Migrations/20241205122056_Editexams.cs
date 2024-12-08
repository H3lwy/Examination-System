using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Infrastructure.Migrations
{
    /// <inheritdoc />
    public partial class Editexams : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "1ad38a70-9715-48a4-ae27-c78a092292ea", "5b00f076-9a00-4d2d-afcf-ace896a16c3f" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "1ad38a70-9715-48a4-ae27-c78a092292ea");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "5b00f076-9a00-4d2d-afcf-ace896a16c3f");

            migrationBuilder.AddColumn<bool>(
                name: "IsCompleted",
                table: "StudentExams",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "69a1702c-6470-45f0-8006-97bcb73a8594", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "b0903ff0-ce2a-4a65-b612-2a0dff5fdfda", 0, "819ccd87-c76a-4fcd-ac84-6fec8ba43cbd", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEOWHoUEdqjpqvB/MyqWdH+R97yn9z3mHbFsCI/Kzxa81MAMtAYPQLMyBkJgm+OijRA==", null, false, "85181bf7-c553-43a6-a9d6-557aa5b5ae1d", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "69a1702c-6470-45f0-8006-97bcb73a8594", "b0903ff0-ce2a-4a65-b612-2a0dff5fdfda" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "69a1702c-6470-45f0-8006-97bcb73a8594", "b0903ff0-ce2a-4a65-b612-2a0dff5fdfda" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "69a1702c-6470-45f0-8006-97bcb73a8594");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "b0903ff0-ce2a-4a65-b612-2a0dff5fdfda");

            migrationBuilder.DropColumn(
                name: "IsCompleted",
                table: "StudentExams");

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[] { "1ad38a70-9715-48a4-ae27-c78a092292ea", null, "Admin", "ADMIN" });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "FirstName", "IsActive", "LastName", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "5b00f076-9a00-4d2d-afcf-ace896a16c3f", 0, "b2a1a9cf-345c-4927-9b41-2990079e1b05", "hisham.3lwy@gmail.com", true, "Hisham", true, "Alwy", false, null, "HISHAM.3LWY@GMAIL.COM", "HISHAM", "AQAAAAIAAYagAAAAEClqcJyK3cznugVe+H0WaMQXqzQq4wiaH4LzmiOrLKNEfFSqESDpJjVOaVZ7BfguVg==", null, false, "7571d858-4201-48e4-a2b8-2de26c77cddb", false, "Hisham" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[] { "1ad38a70-9715-48a4-ae27-c78a092292ea", "5b00f076-9a00-4d2d-afcf-ace896a16c3f" });
        }
    }
}
