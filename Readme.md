# Docker for NameTag3
Automatically installs NameTag3 and downloads the Czech model.
Git for the original repository: https://github.com/ufal/nametag3
Link to the czech model: https://lindat.mff.cuni.cz/repository/xmlui/bitstream/handle/11234/1-5677/nametag3-czech-cnec2.0-240830.zip?sequence=1&isAllowed=y

If you need any other model, feel free to create a pull request.

##  Running the container
### Using docker-compose
1. Clone this repository
2. Run `docker-compose up -d`

### Using docker
1. Clone this repository
2. Run `docker build -t nametag3-server .`
3. Run `docker run -p 8001:8001 -d nametag3-server`

## License
MIT