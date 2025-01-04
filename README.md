# Server Stats Script

A simple shell script to analyze basic server performance statistics. The script collects the following information:
- CPU Usage
- Memory Usage (Free vs Used including percentage)
- Disk Usage (Free vs Used including percentage)
- Top 5 Processes by CPU Usage
- Top 5 Processes by Memory Usage

### Additional Stats (Optional):
- OS Version
- Uptime
- Load Average
- Logged-in Users
- Failed Login Attempts

## Requirements:
- Linux server
- bash shell
- Required tools: `top`, `free`, `df`, `ps`, `lsb_release`, `uptime`, `who`

## Installation & Usage:
1. Clone the repository to your local machine or server:
   ```bash
   git clone https://github.com/rajzandani20/server-stats.git
   https://github.com/rajzandani20/server-stats
