export default function AiHorrorGame() {
    // Adjust these values based on the game's original resolution
    const scale = 0.9; 
    const originalWidth = 1280; 
    const originalHeight = 720;

    return (
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '20px' }}>
            <h2 className="page-header-text">AI Horror Story</h2>
            
            <div className="game-wrapper" style={{ 
                width: `${originalWidth * scale}px`, 
                height: `${originalHeight * scale}px`,
                overflow: 'hidden'
            }}>
                <iframe
                    src="/games/ai_horror/AI Horror Story.html"
                    title="AI Horror Game"
                    width={originalWidth}
                    height={originalHeight}
                    style={{ 
                        transform: `scale(${scale})`, 
                        transformOrigin: 'top left', 
                        border: 'none' 
                    }}
                    scrolling="no"
                ></iframe>
            </div>
        </div>
    )
}