function filter() {
    var genre = document.getElementById("genre").value;
    var plat = document.getElementById("platform").value;

    let games = Array.from(document.getElementsByClassName("game"));

    games.forEach((game) => {
        var is_genre_found = true;
        var is_plat_found = true;

        if (genre != "-") {
            is_genre_found = false;
            let game_genres = Array.from(game.getElementsByClassName("genre"));

            for (let i = 0; i < game_genres.length; i++) {
                var curr_genre = game_genres[i].getAttribute('value');
                if (curr_genre == genre) {
                    is_genre_found = true;
                    break;
                }
            }
        }

        if (plat != "-") {
            is_plat_found = false;
            let game_plats = Array.from(game.getElementsByClassName("plat"));

            for (let i = 0; i < game_plats.length; i++) {
                var curr_plat = game_plats[i].getAttribute('value');
                if (curr_plat == plat) {
                    is_plat_found = true;
                    break;
                }
            }
        }

        if (is_genre_found && is_plat_found) {
            game.style.display = "block";
        }
        else {
            game.style.display = "none";
        }
    });
}