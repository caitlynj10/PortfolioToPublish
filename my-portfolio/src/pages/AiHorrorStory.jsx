export default function AiHorrorStory() {
    return (
        <div>
            <h2 className="page-header-text">AI Horror Story</h2>
            <div className="row">
                <div className="col">
                    <img className="game-image" src={`${import.meta.env.BASE_URL}images/killer_ai.png`} alt="Killer AI"/> 
                </div>
                <div className="col">
                    <card className="about-me-card">
                        <p className="body-text">
                            In my <b><i>Digital Games and Gaming Culture</i></b> class, we were tasked with creating a game relating to current societal events.
                            I decided to create an interactive horror story-like game using the software Twine where the player has an unexpected
                            and dangerous encounter with an old "friend". This game is a commentary on the potential dangers of AI and how
                            it could steal and harvest your information due to overuse.
                            <br />
                            <br />
                            <a href={`${import.meta.env.BASE_URL}games/ai_horror_story/AI Horror Story.html`} target="_blank" rel="noopener noreferrer">
                            Play Game!
                            </a>  
                        </p>
                    </card>
                </div>
            </div>
                     
        </div>
    )
}