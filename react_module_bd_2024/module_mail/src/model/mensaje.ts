import {Destinatario} from "./destinatario.ts";
import {Archivo} from "./archivo.ts";

export interface Mensaje {
    usuario: string;
    idMensaje: string;
    idCarpeta: string;
    nomPais: string;
    idPais:string;
    idMensajePadreM?: string;
    idCategoria: string;
    asunto: string;
    cuerpoMensaje: string;
    fechaAccion: string;
    horaAccion: string;
    destinatario: string;
    idTipoCopia:string;
    listaDestinatariosCO:Destinatario[];
    listaArchivos:Archivo[];
}