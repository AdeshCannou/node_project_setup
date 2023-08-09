# Utilisez une image Node.js officielle en tant qu'image de base
FROM node:18

# Installe PNPM globalement dans le conteneur
RUN npm i -g pnpm

# Définir le répertoire de travail pour les commandes suivantes
WORKDIR /usr/src/app

# Copier les fichiers package.json et pnpm-lock.yaml depuis le répertoire local vers le répertoire de travail du conteneur
COPY package.json pnpm-lock.yaml ./

# Installer les dépendances du projet à partir du fichier package.json
RUN pnpm install --frozen-lockfile

# Copier tout le contenu du répertoire local vers le répertoire de travail du conteneur
COPY . .

# Spécifier que le conteneur écoutera sur le port 8080
EXPOSE 8080

# Définir la commande par défaut à exécuter lorsque le conteneur est démarré
CMD [ "pnpm", "start" ]
