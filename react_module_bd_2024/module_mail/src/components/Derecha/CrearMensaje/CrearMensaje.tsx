import {useRef} from 'react';
import './CrearMensaje.css';
import {usePerfil} from "../../../hooks/usePerfil.ts";

export const CrearMensaje = () => {
    const {perfil} = usePerfil();
    // Referencias para los inputs
    const asuntoRef = useRef(null);
    const cuerpoMensajeRef = useRef(null);
    const archivoRef = useRef(null);
    const remitentesOcultosRef = useRef(null);
    const destinatariosRef = useRef(null);
    const destinatariosCORef = useRef(null);
    const destinatariosCOORef = useRef(null);
    const categoriaRef = useRef(null);

    // vamos a sacar a cada uno de los destinatarios
    const destinatarios:string[] = () =>
    {
        const destString:string = destinatariosRef;
        const dest:string[] = destString.split(',');
        return dest;
    }



    const onClickButton = () => {
        console.log(
            "usuario: " + perfil +
            "idCarpeta" + "env" +
            "nomPais" + perfil.pais +
            "idMensajePadreM,"+ ""+
            "idCategoria," +categoriaRef +
            "asunto," + asuntoRef +
            "cuerpoMensaje," + cuerpoMensajeRef +
            "fechaAccion," + Date.now()+
            "horaAccion"+ new Date().getHours()+
            "destinatario"+ destinatariosRef
        );
    }


    //TODO: Aqui debemos arreglar cosas del css y ademas puede que, si hayganas, crear los componentes xd, pero eso . . .

    return (
        <div className="crear-mensaje">
            <div className="cabecera">
                <h2>Nuevo Mensaje</h2>
            </div>
            <form className="formulario-mensaje">
                <div className="campo-destinatarios">
                    <label>Para:</label>
                    <input
                        type="text"
                        placeholder="Ingresa destinatarios"
                        ref={destinatariosRef}
                        required
                    />
                </div>

                <div className="campo-cc">
                    <label>CC:</label>
                    <input
                        type="text"
                        placeholder="Ingresa destinatarios en copia"
                        ref={destinatariosCORef}
                    />
                </div>

                <div className="campo-cco">
                    <label>CCO:</label>
                    <input
                        type="text"
                        placeholder="Ingresa destinatarios en copia oculta"
                        ref={destinatariosCOORef}
                    />
                </div>

                <div className="campo-asunto">
                    <input
                        type="text"
                        placeholder="Asunto"
                        ref={asuntoRef}
                        required
                    />
                </div>

                <div className="campo-categoria">
                    <label>Categoría:</label>
                    <select ref={categoriaRef}>
                        <option value="promocion">Promoción</option>
                        <option value="importante">Importante</option>
                        <option value="spam">Spam</option>
                        <option value="social">Social</option>
                    </select>
                </div>

                <div className="campo-cuerpo">
                    <textarea
                        placeholder="Escribe tu mensaje aquí..."
                        ref={cuerpoMensajeRef}
                        required
                    />
                </div>

                <div className="campo-adjuntos">
                    <label htmlFor="archivo" className="boton-adjuntar">
                        <span>📎 Adjuntar archivo</span>
                        <input
                            type="file"
                            id="archivo"
                            ref={archivoRef}
                            style={{display: 'none'}}
                        />
                    </label>
                </div>

                <div className="campo-opciones">
                    <label>
                        <input
                            type="checkbox"
                            ref={remitentesOcultosRef}
                        />
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