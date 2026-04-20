export default function Sudoku() {
    const originalWidth = 540;
    const originalHeight = 690;

    return (
        <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
            <h2 className="page-header-text" style={{ margin: '10px' }}>Sudoku</h2>
            
            <div className="game-wrapper" style={{ 
                width: `${originalWidth}px`, 
                height: `${originalHeight}px`, 
                margin: '10px',
                overflow: 'hidden',
            }}>
                <iframe
                    src="/games/sudoku/index.html"
                    title="Sudoku Game"
                    width={originalWidth}
                    height={originalHeight}
                    style={{ border: 'none' }}
                    scrolling="no"
                ></iframe>
            </div>
        </div>
    )
}