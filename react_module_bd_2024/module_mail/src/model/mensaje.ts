export interface Mensaje {
    usuario: string;
    idMensaje: string;
    idCarpeta: string;
    nomPais: string;
    idMensajePadreM?: string;
    idCategoria: string;
    asunto: string;
    cuerpoMensaje: string;
    fechaAccion: string;
    horaAccion: string;
    destinatario: string;
}