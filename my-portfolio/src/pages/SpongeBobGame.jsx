export default function SpongeBobGame() {
    const scale = 0.8; // 0.7 scale makes the 800px game appear as 560px
    const originalSize = 800;
    const scaledSize = originalSize * scale;

    return (
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '20px' }}>
            <h2 className="page-header-text">Krabby Patty Catcher</h2>
            
            <div className="game-wrapper" style={{ 
                width: `${scaledSize}px`, 
                height: `${scaledSize}px`, 
            }}>
                <iframe
                    src="/games/spongebob/index.html"
                    title="SpongeBob Game"
                    width={originalSize}
                    height={originalSize}
                    style={{ transform: `scale(${scale})`, transformOrigin: 'top left', border: 'none' }}
                    scrolling="no"
                ></iframe>
            </div>
        </div>
    )
}
