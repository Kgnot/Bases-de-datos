import { useState } from 'react';
import './CrearMensaje.css';
import { usePerfil } from "../../../hooks/usePerfil.ts";
import { Archivo } from "../../../model/archivo.ts";
import {useMensaje} from "../../../hooks/useMenesaje.ts";

export const CrearMensaje = () => {
    const { perfil } = usePerfil();
    const {enviarMensaje} = useMensaje();
    const [asunto, setAsunto] = useState("");
    const [cuerpoMensaje, setCuerpoMensaje] = useState("");
    const [categoria, setCategoria] = useState("");
    const [destinatarios, setDestinatarios] = useState("");
    const [cc, setCc] = useState("");
    const [cco, setCco] = useState("");
    const [archivo, setArchivo] = useState<Archivo | null>(null);
    const [remitentesOcultos, setRemitentesOcultos] = useState(false);

    const onSubmit = (e: { preventDefault: () => void; }) => {
        e.preventDefault();
        const fechaActual = new Date();

        const mensaje = {
            usuario: perfil.usuario,
            idMensaje: "-", // Se podría generar dinámicamente
            idCarpeta: "env",
            nomPais: perfil.pais,
            idPais: perfil.pais, // Esto se debe obtener dinámicamente
            idMensajePadre: "",
            idCategoria: categoria,
            asunto,
            cuerpoMensaje,
            fechaAccion: fechaActual.toISOString(), // Formato ISO: yyyy-MM-dd'T'HH:mm:ss.SSSX
            horaAccion: fechaActual.toISOString(), // Formato compatible con Timestamp
            destinatario: destinatarios,
            idTipoCopia: "co",
            listaArchivos: archivo ? [{ nomArchivo: archivo.nomArchivo, tipoArchivo: archivo.tipoArchivo }] : []
        };

        console.log("Mensaje a enviar:", mensaje);
        // Aquí puedes hacer una petición HTTP para enviar el mensaje
        enviarMensaje(mensaje); // está debería ser xdd
    };

    const handleArchivo = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files.length > 0) {
            const file = e.target.files[0];
            setArchivo({ nomArchivo: file.name, tipoArchivo: file.type });
        }
    };

    return (
        <div className="crear-mensaje">
            <div className="cabecera">
                <h2>Nuevo Mensaje</h2>
            </div>
            <form className="formulario-mensaje" onSubmit={onSubmit}>
                <div className="campo-destinatarios">
                    <label>Para:</label>
                    <input type="text" placeholder="Ingresa destinatarios" value={destinatarios} onChange={e => setDestinatarios(e.target.value)} required />
                </div>
                <div className="campo-cc">
                    <label>CO:</label>
                    <input type="text" placeholder="Ingresa destinatarios en copia" value={cc} onChange={e => setCc(e.target.value)} />
                </div>
                <div className="campo-cco">
                    <label>COO:</label>
                    <input type="text" placeholder="Ingresa destinatarios en copia oculta" value={cco} onChange={e => setCco(e.target.value)} />
                </div>
                <div className="campo-asunto">
                    <input type="text" placeholder="Asunto" value={asunto} onChange={e => setAsunto(e.target.value)} required />
                </div>
                <div className="campo-categoria">
                    <label>Categoría:</label>
                    <select value={categoria} onChange={e => setCategoria(e.target.value)}>
                        <option value="PRI">Principal</option>
                        <option value="PRO">Promoción</option>
                        <option value="SOC">Social</option>
                        <option value="NOT">Notificación</option>
                        <option value="FOR">Foro</option>
                        <option value="INP">Importante</option>
                        <option value="SAP">Spam</option>
                        <option value="PAP">Papelera</option>
                    </select>
                </div>
                <div className="campo-cuerpo">
                    <textarea placeholder="Escribe tu mensaje aquí..." value={cuerpoMensaje} onChange={e => setCuerpoMensaje(e.target.value)} required />
                </div>
                <div className="campo-adjuntos">
                    <label htmlFor="archivo" className="boton-adjuntar">
                        <span>📎 Adjuntar archivo</span>
                        <input type="file" id="archivo" onChange={handleArchivo} style={{ display: 'none' }} />
                    </label>
                </div>
                <div className="campo-opciones">
                    <label>
                        <input type="checkbox" checked={remitentesOcultos} onChange={e => setRemitentesOcultos(e.target.checked)} />
                        Remitentes Ocultos
                    </label>
                </div>
                <div className="boton-enviar-container">
                    <button type="submit" className="boton-enviar">Enviar</button>
                </div>
            </form>
        </div>
    );
};
