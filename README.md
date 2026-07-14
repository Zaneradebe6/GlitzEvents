# Glitz Events

**Glitz Events** is a South African event-planning platform that lets customers browse and book customizable event packages — décor, catering, seating, and sound — in one place, instead of contacting multiple vendors separately for weddings, birthdays, and graduations.

## Live Demo

🔗 *Coming soon — deployment in progress.*

## The Problem

Planning an event usually means contacting separate vendors for décor, catering, seating, and sound — each with their own pricing, availability, and back-and-forth communication. Glitz Events consolidates this into a single platform where customers can browse packages and submit one booking for everything they need.

## Features

- **Public browsing** — Services, Portfolio, About, and Contact pages are open to all visitors, no account required
- **User registration & login** — secure account creation with session-based authentication
- **Event booking** — authenticated users can submit a booking with event type, date range, guest count, address, and special requests
- **Admin dashboard** — a separate admin view for managing users and bookings, including filtering, status updates (Pending/Confirmed), and record management
- **Role-based access** — admin-only features are restricted to accounts flagged as administrators

## Tech Stack

| Layer | Technology |
|---|---|
| Language | C# |
| Framework | ASP.NET Web Forms (.NET Framework 4.7.2) |
| Frontend | HTML, CSS |
| Database | SQL Server (LocalDB), accessed via ADO.NET (`SqlConnection` / `SqlCommand`) |
| Auth | Session-based authentication |

## Getting Started (Run It Locally)

### Prerequisites
- Visual Studio 2022 (Community edition is free) with the **ASP.NET and web development** workload
- SQL Server LocalDB (installed automatically with the Visual Studio workload above)

### Setup
1. Clone the repository:
   ```
   git clone https://github.com/<your-username>/Glitz_Events.git
   ```
2. Open `Glitz_Events.sln` in Visual Studio
3. Restore NuGet packages (Visual Studio usually does this automatically on open — if not: right-click the solution → **Restore NuGet Packages**)
4. Confirm the connection string in `Web.config` points to your local SQL Server LocalDB instance
5. Press **F5** to build and run

## Database

The app uses two main tables:

- **users** — stores account details (name, email, hashed password, admin flag)
- **Bookings** — stores each booking submission, linked to the user who made it (event type, dates, guest count, address, status)

## Roadmap

This project is actively being improved as part of our ongoing portfolio work:

- [ ] Migrate from ASP.NET Web Forms to **ASP.NET Core MVC** with **Entity Framework Core**
- [ ] Replace session-based auth with **ASP.NET Core Identity** (adds properly salted password hashing, replacing the current SHA1 approach)
- [ ] Model event packages (décor, catering, seating, sound) as real database entities, allowing customers to select specific packages per booking rather than a general request
- [ ] Deploy to a live environment (Azure)
- [ ] Add automated tests

## Author

Built by Zanele Radebe, Ntswaki Mokwana and Bonolo Masemola — final-year BSc Information Technology students, North-West University.

- GitHub: @ZaneRadebe6(https://github.com/Zaneradebe6)
- Github: Bonolo4(https://github.com/Bonolo4)
- GitHub: ReymondsMokwana(https://github.com/ReymondsMokwana)


## License

This project is available under the MIT License.
