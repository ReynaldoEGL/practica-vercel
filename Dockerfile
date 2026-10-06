# Imagen oficial de Node.js 20 sobre Debian Bookworm.
# Next.js 16 requiere Node.js 20.9 o superior.
FROM node:20.20.2-bookworm

# Directorio de trabajo dentro del contenedor.
WORKDIR /app

# Copiar primero los archivos de dependencias.
# Esto permite aprovechar la caché de Docker.
COPY package*.json ./

# Instalar exactamente las dependencias indicadas en package-lock.json.
RUN npm ci

# Copiar el resto del proyecto al contenedor.
COPY . .

# Puerto utilizado por Next.js.
EXPOSE 3000

# Iniciar Next.js en modo desarrollo.
CMD ["npm", "run", "dev", "--", "--hostname", "0.0.0.0"]