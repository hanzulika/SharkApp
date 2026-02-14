# SharkApp

A Ruby on Rails application for managing shark information. Built as a learning project following the DigitalOcean Rails tutorial.

## About

SharkApp allows users to view shark entries with names and facts. Authenticated users can create, edit, and delete shark entries. The application includes data validations and basic authentication.

## Technology Stack

- **Ruby 4.0.1**
- **Rails 8.1.2**
- **SQLite3** - Database
- **Node.js & npm** - JavaScript runtime and package manager
- **rbenv** - Ruby version management

## Features

- **CRUD Operations** - Create, read, update, and delete shark entries
- **Data Validations**
  - Shark names must be unique
  - Both name and facts fields are required
- **Authentication** - Only authenticated users can modify data (create, update, delete)
- **Public Viewing** - Anyone can view shark information without authentication

## Development Environment

- **Server:** Debian (terminal-only, always-on system)
- **Client:** Windows 11 laptop
- **Remote Access:** Tailscale for secure connection between devices
- **Firewall:** UFW configured to allow port 3001 for development server

## Setup and Installation

### Prerequisites

```bash
# Install SQLite3
sudo apt install sqlite3 libsqlite3-dev

# Install Node.js and npm
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs

# Install rbenv and Ruby
# Follow: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-ubuntu-18-04
```

### Application Setup

```bash
# Clone the repository
git clone git@github.com:hanzulika/SharkApp.git
cd SharkApp

# Install dependencies
bundle install

# Setup database
rails db:migrate

# Start the server (remote, bound to specific IP)
rails server --binding=TAILSCALE_IP -p 3001
```

Access the application at `http://TAILSCALE_IP:3001`

## Usage

### Viewing Sharks
Navigate to the homepage to see all sharks. Click on any shark to view its details.

### Adding/Editing Sharks
Click "New Shark" or "Edit" buttons. You'll be prompted for authentication:
- **Username:** hanzu
- **Password:** shark

### Data Requirements
- **Name:** Must be unique and cannot be empty
- **Facts:** Cannot be empty

## Project Structure

```
sharkapp/
├── app/
│   ├── controllers/     # Application logic
│   ├── models/          # Data models with validations
│   └── views/           # HTML templates
├── config/
│   ├── routes.rb        # URL routing configuration
│   └── database.yml     # Database configuration
├── db/
│   ├── migrate/         # Database migrations
│   └── schema.rb        # Database schema
└── test/                # Test files
```

## Key Configurations

### Authentication
Located in `app/controllers/application_controller.rb`:
- Authenticated actions: create, update, destroy
- Public actions: index (list all), show (view details)

### Validations
Located in `app/models/shark.rb`:
- Name must be present and unique
- Facts must be present

### Routes
The root path (`/`) displays the sharks index page.

## Development Notes

- Used `rails generate scaffold` to create the initial model, views, and controller
- Modified `.gitignore` to exclude unnecessary files from version control
- Connected to GitHub using SSH keys for secure authentication
- UFW firewall configured to allow traffic on port 3000 for testing
- Used port 3001 when port 3000 was occupied by Docker

## Learning Resources

This project was built following the DigitalOcean tutorial:
- [How To Build a Ruby on Rails Application](https://www.digitalocean.com/community/tutorials/how-to-build-a-ruby-on-rails-application)

## License

This is a learning project created for educational purposes.
