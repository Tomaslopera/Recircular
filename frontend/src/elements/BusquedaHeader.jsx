import { useState } from "react";

import styled from "styled-components";
import colores from "../styles/colores";
import { HiMiniMagnifyingGlass } from "react-icons/hi2"
import Filtros from "./Filtros";
import { useUser, UserContextProvider } from "../context/userContext"
import { useMessage } from "../context/messageContext";

const ContenedorBusqueda = styled.form`
    display: flex;
    height: 40px;
    width: 100%;
    justify-content: center;

    @media (max-width: 800px) {
        margin: 20px;
        margin-bottom: 10px;
        height: 30px;
    }
`
const Input = styled.input`
    background-color: #fff;
    opacity: .8;
    border: 1px solid #fff;
    outline: none;
    padding: 10px;
    width: 350px;
    max-width: 350px;

    @media (max-width: 1000px) { width: 300px; } 

    @media (max-width: 800px) {
        width: 80%;
        border-radius: 10px 0 0 10px;
    }
`
const BtnBuscar = styled.button`
    background-color: ${colores.verdeOscuro};
    border: none;
    border-radius: 0 10px 10px 0;
    cursor: pointer;

    svg {
        width: 25px;
        height: 25px;
        margin: 0 10px;
    }

    @media (max-width: 800px) {
        svg {
            width: 20px;
            height: 20px;
        }
    }
`

const BusquedaHeader = () => {
    const [busqueda, setBusqueda] = useState("");

    const { searchProduct } = useUser();

    const { newMessage } = useMessage();

    const handleSubmit = async (e) => {
        e.preventDefault();

        try {

            const respuesta = await searchProduct(busqueda)

            if (typeof respuesta === 'string') newMessage(respuesta, "error");
            else{
                console.log(respuesta.data)
                newMessage("Exitoso", "exito")
            } 
        } catch (error) {
            console.error(error)
        }
    }

    return (
        <ContenedorBusqueda  onSubmit={handleSubmit}>
            {window.innerWidth>800 && <Filtros /> }
            <Input 
                name = "buscar"
                type="text"
                placeholder="Buscar"
                value={busqueda}
                onChange={(e) => setBusqueda(e.target.value)}
            />
            <BtnBuscar>
                <HiMiniMagnifyingGlass />
            </BtnBuscar>
        </ContenedorBusqueda>
    )
}

export default BusquedaHeader;