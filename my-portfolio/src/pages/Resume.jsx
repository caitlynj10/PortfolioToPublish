import { Document, Page, pdfjs } from "react-pdf";

pdfjs.GlobalWorkerOptions.workerSrc = `https://unpkg.com/pdfjs-dist@${pdfjs.version}/build/pdf.worker.min.mjs`;

export default function Resume() {
    return (
        <div className="res">
            <h2 className="page-header-text">Resume</h2>
            <div style={{ display: 'flex', justifyContent: 'center', margin: "10px"}}>
                <Document 
                    file={`${import.meta.env.BASE_URL}images/RESUME 2026.pdf`}
                    onLoadError={console.error}
                >
                    <Page pageIndex={0} renderTextLayer={false} renderAnnotationLayer={false} />
                </Document>
            </div>
        </div>
    )
}