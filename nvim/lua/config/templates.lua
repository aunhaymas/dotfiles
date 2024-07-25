--Alias
------------------------------------------------------------------------------------------------------------------------
local cmd = vim.cmd                     --Vim commands
local exec = vim.api.nvim_exec          --Vim scripts
local fn = vim.fn                       --Vim functions
local g = vim.g                         --Global Variables
local opt = vim.opt                     --Global/buffer/windows-scoped-options
g.path=""

g.author_name = 'Alfredo Godoy <a.k.a aunhaymas>' --Author alias or name
--Orthographic Correction for markdown
------------------------------------------------------------------------------------------------------------------------
exec ([[
    augroup markdownSpell
        autocmd!
	autocmd FileType markdown setlocal spell spelllang=es
	autocmd BufRead,BufNewFile *.md setlocal spell spelllang=es
    augroup END
    ]], false)

------------------------------------------------------------------------------------------------------------------------
--<afile> representa el nombre del archivo actual.
--"archivo" a secas
--
--[<afile>:e] representa la extension del archivo por ejemplo de archivo.txt devuelve txt
--"archivo.txt" completo con su extension

--[autocmd]
--autocmd [Evento] [Patron] [Comando]
--Evento es el evento que desencadena el autocomando. en este caso es BufNewFile (creacion de nuevo archivo)

--Patron es un patrón que especifica en qué circunstancias se activa el autocomando.El patron que busca es *.*
--(*.* significa que hay una palabra antes y despues del punto, osea que no se activara para un archivo llamado ".c" ó "archivo.")


--[Comando] es el comando o serie de comandos que se ejecutarán cuando se active el autocomando.
--[silent!] suprime cualquier msg de error que haga el siguiente comando
--[execute] ejecuta un string como si fuera un comando
--0r es [posicion de la linea][read] sirve para leer un archivo y pegarlo en la linea indicada
--
--autocmd BufNewFile *.* silent! execute '0r $HOME/.config/nvim/lua/templates/'.expand("<afile>:e").'.tpl'
--$HOME/.config/nvim/lua/templates/ esta es la carpeta donde buscara los archivos

--uso el punto para concatenar strings, el del directorio con lo siguiente:
-- expand("<afile>:e") esto devuelve la extension del archivo actual, por ejemplo txt
-- uso otro punto . para concatenar con lo siguiente
-- '.tpl'
--
-- entonces si creo un archivo llamado archivo.c esta funcion buscara el ["<afile>:e".'.tpl'] es decir 'c.tpl'
-- en la carpeta $HOME/.config/nvim/lua/templates/
-- luego, utilizando 0r copiara el contenido del archivo c.tpl dentro del buffer, es decir en el archivo actual
-- archivo.c
--Templates
exec ([[
    augroup templates
      au!
      autocmd BufNewFile *.* silent! execute '0r $HOME/.config/nvim/lua/templates/'.expand("<afile>:e").'.tpl'
      autocmd BufNewFile * %s/{{YEAR}}/\=strftime('%Y')/ge
      autocmd BufNewFile * %s/{{HOUR}}/\=strftime('%H:%M:%S')/ge
      autocmd BufNewFile * %s/{{NAME}}/\=author_name/ge
      autocmd BufNewFile * %s/{{EVAL\s*\([^}]*\)}}/\=eval(submatch(1))/ge
    augroup END
    ]], false)


--autocmd BufNewFile * %s/{{YEAR}}/\=strftime('%Y')/ge
-- uso * para indicar que vale cualquier archivo. Normalmente BufNewFile no contiene nada, pero ya lo rellene con
-- el comando de arriba
--
--%s/patron/reemplazo/g
--
--%s/{{YEAR}}/\=strftime('%Y')/ge
--
--el patrón es la etiqueta {{YEAR}}
--el reemplazo es \=strftime('%Y')
--los modificadores que existen son g,e,i,c,I
--g |es global, reemplazo en todo el archivo
--e |significa silencioso o sin errores
--c confirmar | solicita confirmar antes de cada reemplazo
--i insensible a mayusculas/minusculas | si quiero cambiar "edificio" por "casa", tomara en cuenta EdiFiciO, EDIFIcio, etc
--y los cambiará a todos por igual por "casa"
--I insensible a mayusculas/minusculas solo en el patron | buscara EdiFiciO, EDIFIcio, etc pero mantendrá
--su capitalizacion original cambiandolo a CasA,CASA,etc


------------------------------------------------------------------------------------------------------------------------
--Ident_Config_for_c
exec ([[
	augroup c_config
    autocmd!
    autocmd FileType c setlocal noexpandtab tabstop=4 shiftwidth=4 colorcolumn=80
	augroup END
	]], false)
