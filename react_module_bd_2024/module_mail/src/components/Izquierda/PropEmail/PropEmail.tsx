import './PropEmail.css'
import {ListItem} from "../ListItems/ListItem.tsx";
import {useFetch} from "../../../hooks/useFetch.ts";
import {Carpeta, CarpetaAdapter} from "../../../model/carpeta.ts";
import {Item} from "../../../model/item.ts";
import {Categoria, CategoriaAdapter} from "../../../model/Categoria.ts";


export const PropEmail = () => {

    const {data, loading, error} = useFetch<Carpeta[]>("http://localhost:8083/tipo_carpeta");
    console.log("data: ", data)
    const {
        data: dataCat,
        loading: loadingCat,
        error: errorCat
    } = useFetch<Categoria[]>("http://localhost:8083/categoria");

    if (loading || loadingCat) {
        return <div>Loading...</div>;
    }

    if (error) {
        return <div>Error: {error.message}</div>;
    }

    if (errorCat) {
        return <div>Error: {errorCat.message}</div>;
    }

    if (!data || !dataCat) {
        return <div>No se encontraron carpetas.</div>;
    }

    const adaptedItemsCarpeta = data.map((carpeta: Carpeta) => new CarpetaAdapter(carpeta)) as Item[];
    const adaptedItemsCat = dataCat.map((cat: Categoria) => new CategoriaAdapter(cat)) as Item[];

    return (
        <>
            <div className="propEmail">
                <ListItem titulo={"Carpetas"} items={adaptedItemsCarpeta}/>
                <ListItem titulo={"Categorías"} items={adaptedItemsCat}/>
            </div>
        </>
    )
}