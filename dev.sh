#!/bin/bash
# Development server script for Antisocial Gallery

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fixed port for consistency
PORT=8080

echo -e "${YELLOW}Starting Antisocial Gallery Development Server...${NC}"

# Kill any existing Hugo processes
echo -e "${RED}Killing any existing Hugo processes...${NC}"
pkill -f "hugo server" 2>/dev/null || true
sleep 1

# Clear the terminal for clean output
clear

# Start Hugo server
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🚀 Antisocial Gallery Development Server${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${YELLOW}📍 Local URL:${NC} http://localhost:${PORT}/"
echo -e "${YELLOW}📍 Network URL:${NC} http://$(ipconfig getifaddr en0 2>/dev/null || echo "localhost"):${PORT}/"
echo -e "${RED}📍 Note:${NC} If you get a 404, try adding '/antisocial-fiverings-photo/' to the URL"
echo ""
echo -e "${YELLOW}Press Ctrl+C to stop the server${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Run Hugo server with development config
# This merges hugo.toml with hugo.dev.toml, with dev settings taking precedence
hugo server -D --bind 0.0.0.0 --port ${PORT} --disableFastRender --config hugo.toml,hugo.dev.toml