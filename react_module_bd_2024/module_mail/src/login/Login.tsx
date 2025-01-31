import './Login.css'
import {BotonProvisionalLOGIN} from "../components/utils/BotonProvisionalLOGIN/BotonProvisionalLOGIN.tsx";
import {useRef} from "react";
import {usePerfil} from "../hooks/usePerfil.ts";


export const Login = () => {
    const emailRef = useRef<HTMLInputElement>(null); // Referencia para el input de email
    const {initUser} = usePerfil();


    const obtenerNombre = (): string => {
        const email = emailRef.current?.value.trim() || "";
        return email.split("@")[0];
    };

    return (
        <>
            <div className="login_container">
                <h1>LOGIN</h1>
                <div className="input_group">
                    <label htmlFor="email">USUARIO</label>
                    <input
                        type="email"
                        id="email"
                        placeholder="Usuario"
                        ref={emailRef}
                    />
                </div>
                <div className="input_group">
                    <label htmlFor="password">PASSWORD</label>
                    <input type="password" id="password" placeholder="contraseña" />
                </div>
                <p className="forgot_password">FORGOT YOUR PASSWORD?</p>
                <div className="button_group">
                    <button className="register_button">REGISTER</button>
                    <BotonProvisionalLOGIN method={()=>initUser(obtenerNombre())}/>
                </div>
            </div>
        </>
    );
};